# Log external functions
Are used to manipulate players log and to track quest progress.


## Log_CreateTopic
Creates a new log topic with the name `topicName` under the section `logSection`

```dae
func void Log_CreateTopic(var string topicName, var int logSection) {};
```

- `topicName` - unique string used to identifiy and name the topic
- `logSection` - indicates in which section to create the topic in  
Takes constants `LOG_MISSION`, `LOG_NOTE` as values

## Log_AddEntry
Adds an entry to a log topic with the name `topicName` under the section `logSection`

```dae
func void Log_AddEntry(var string topicName, var string entry) {};
```

- `topicName` - unique string used to identifiy and name the topic
- `entry` - content of the new entry

## Log_SetTopicStatus
Changes the status of the topic with the name `topicName`

```dae
func void Log_SetTopicStatus(var string topicName, var int status) {};
```

- `topicName` - unique string used to identifiy and name the topic
- `status` - the status to be set  
Takes constants `LOG_RUNNING`, `LOG_SUCCESS`, `LOG_FAILED`, `LOG_OBSOLETE` as values
## Externals with docu comments

```dae
/// Creates a new log topic with the name `topicName` under the section `logSection`
/// 
/// @param topicName unique string used to identifiy and name the topic
/// @param logSection [LOG_MISSION, LOG_NOTE] indicates in which section to create the topic in
func void Log_CreateTopic(var string topicName, var int logSection) {};

/// Adds an entry to a log topic with the name `topicName` under the section `logSection`
/// 
/// @param topicName unique string used to identifiy and name the topic
/// @param entry content of the new entry
func void Log_AddEntry(var string topicName, var string entry) {};

/// Changes the status of the topic with the name `topicName`
///
/// @param topicName unique string used to identifiy and name the topic
/// @param status [LOG_RUNNING, LOG_SUCCESS, LOG_FAILED, LOG_OBSOLETE] the status to be set
func void Log_SetTopicStatus(var string topicName, var int status) {};
```

## zParserExtender
If you look at the log external selection, you may notice that there are only functions to create a log entry and set its status, but there are no functions to read the log status from the log (as discussed on [Inside Gothic](https://ataulien.github.io/Inside-Gothic/QuestLog/)). As a result of this the original scripters had to define additional variable, that was tracking the log status on the side of the scripts, eve though the value was already tracked in the engine, there was just no way to get it back to Daedalus.  
zParserExtender fixes this by introducing new [log external functions](../extenders/zParserExtender/externals/log.md).