# Offline Messaging Implementation

## Overview
The chat handler now supports offline message handling with WebSocket connection monitoring. When there's no internet connection or WebSocket is disconnected, messages are queued locally and automatically sent when connectivity is restored.

## Features
- **Dual Connectivity Detection**: Monitors both internet connectivity AND WebSocket connection status
- **Message Queueing**: Messages sent while offline/disconnected are stored in a queue
- **Automatic Retry**: Queued messages are automatically sent when both internet and socket are connected
- **No Duplicates**: Messages are only added to UI once, even when retrying
- **Status Updates**: UI receives real-time status updates through the existing stream
- **Socket Reconnection**: Automatically attempts to reconnect and send pending messages

## Message Status
Messages now have a `messageStatus` field with the following possible values:
- `sending`: Message is being sent
- `sent`: Message was successfully sent
- `unsent`: Message is queued (no internet connection)
- `delivered`: Message was delivered (if supported by server)
- `read`: Message was read (if supported by server)

## Usage

### Accessing Message Status in UI
The message status is available through the `ChatEntity`:

```dart
// In your chat message widget
final chatEntity = lazyDataEntity.chatEntity.target;
final messageStatus = chatEntity?.messageStatus;

// Display status indicator based on messageStatus
Widget buildStatusIndicator() {
  switch (messageStatus) {
    case 'unsent':
      return Icon(Icons.schedule, color: Colors.orange);
    case 'sending':
      return CircularProgressIndicator();
    case 'sent':
      return Icon(Icons.check, color: Colors.grey);
    case 'delivered':
      return Icon(Icons.done_all, color: Colors.grey);
    case 'read':
      return Icon(Icons.done_all, color: Colors.blue);
    default:
      return SizedBox.shrink();
  }
}
```

### Sending Messages
No changes required to the existing API. The handler automatically detects connectivity:

```dart
await ChatHandler.instance.preparePayloadAndSendMessage(
  ChatTransactionEventEnum.message,
  messageContent,
  channelId,
);
```

### Initialization
Make sure to call `connectAndListen()` when starting your chat:

```dart
await ChatHandler.instance.connectAndListen();
```

### Cleanup
When disposing your chat screen or app, call dispose:

```dart
ChatHandler.instance.dispose();
```

## How It Works

1. **Message Creation**: When you send a message, the handler checks:
   - Internet connectivity (via connectivity_plus)
   - WebSocket connection status (via SocketApi)
   
2. **Both Connected**: Message is marked as `sending` and immediately sent via WebSocket

3. **Either Disconnected**: 
   - Message is marked as `unsent`
   - Message added to UI (only once)
   - Message stored in pending queue
   - **If internet is available but socket is down, automatically attempts to reconnect**
   
4. **Automatic Reconnection**: 
   - When internet available but socket disconnected: calls `reconnect()` immediately
   - Listens to both internet connectivity and socket connection streams
   - When internet restored: attempts socket reconnection
   - When socket reconnects: automatically processes all pending messages
   
5. **Processing Pending Messages**:
   - Checks internet connectivity
   - **Ensures socket is connected (reconnects if needed)**
   - Updates status from `unsent` to `sending`
   - Sends messages via WebSocket
   - Updates existing UI entries (no duplicates added)

## Technical Details

### Files Modified/Created

**Domain Package:**
- `chat_handler.dart`: Added dual connectivity monitoring (internet + socket) and message queueing
- `chat_entity.dart`: Added `messageStatus` field
- `connectivity_service.dart`: New service for monitoring network status
- `message_status_enum.dart`: Enum for message status values
- `chat_transaction_remote_repository.dart`: Exposed socket connection status

**Services Package:**
- `socket_api.dart`: Added connection status stream and getter

### Dependencies Added
- `connectivity_plus: ^6.1.4` in domain package

## Notes
- Messages are kept in memory queue, not persisted to disk between app restarts
- If you need persistence, consider adding the pending messages to local database
- The implementation maintains the existing stream-based architecture
- UI automatically receives updates through the existing `getMessageStream()` method
- **No duplicate messages**: Each message is only added to UI once, updates are sent to existing entries
- **Socket-aware**: Checks WebSocket connection status, not just internet connectivity
- **Auto-reconnect**: When socket disconnects but internet is available, it triggers reconnection
