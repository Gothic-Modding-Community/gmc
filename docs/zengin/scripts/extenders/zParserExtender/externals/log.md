# Log functions
As discussed on [Inside Gothic](https://ataulien.github.io/Inside-Gothic/QuestLog/), vanilla Gothic has no way of getting the status of a quest. These functions implement that functionality.

## Log_GetTopicStatus
Returns the status of diary topic

- `-1` - Not found
- `0` - Free
- `1` - Running
- `2` - Success
- `3` - Failure
- `4` - Obsolete

```c++
func int Log_GetTopicStatus(var string topic)
```

- `topic` - name of the topic
- `return` - topic status

## Log_GetTopicSection
Returns the topic the diary topic is in

- `-1` - Not found
- `0` - Missions
- `1` - Notes
- `2` - All

```c++
func int Log_GetTopicSection(var string topic)
```

- `topic` - name of the topic
- `return` - topic section

## Externals with docu comments
```c++
/// Returns the status of diary topic
/// Not found   - (-1)
/// Free        - 0
/// Running     - 1
/// Success     - 2
/// Failure     - 3
/// Obsolete    - 4
///
/// @param topic name of the topic
/// @return topic status
func int Log_GetTopicStatus(var string topic) {};

/// Returns the topic the diary topic is in
/// Not found   - (-1)
/// Missions    - 0
/// Notes       - 1
/// All         - 2
///
/// @param topic name of the topic
/// @return topic section
func int Log_GetTopicSection(var string topic) {};

```
