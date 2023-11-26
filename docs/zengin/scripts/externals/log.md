---
title: Log functions
---
# Log external functions
Log externals are used to manipulate players log and to track quest progress.


## `Log_CreateTopic`
Creates a new log topic with the name `topicName` under the section `logSection`

```dae
func void Log_CreateTopic(var string topicName, var int logSection) {};
```
**Parameters**

- `#!dae var string topicName`   
    Unique string used to identify and name the topic
- `#!dae var int logSection`   
    Indicates in which section to create the topic in.  
    Takes constants `LOG_MISSION`, `LOG_NOTE` as values

## `Log_AddEntry`
Adds an entry to a log topic with the name `topicName` under the section `logSection`

```dae
func void Log_AddEntry(var string topicName, var string entry) {};
```
**Parameters**

- `#!dae var string topicName`   
    Unique string used to identify and name the topic
- `#!dae var string entry`   
    Content of the new entry

!!! Info
    In the engine the `#!dae Log_AddEntry()` is wrapped in a `#!dae B_LogEntry()` function. This function also handles printing the "New Journal Entry" message to the screen and playing the sound effect.
    ```dae
    func void B_LogEntry(var string topic, var string entry)
    {
        PrintDebugNpc(PD_ZS_DETAIL, "B_LogEntry"); // Logging

        Log_AddEntry(topic, entry);

        PrintScreen(NAME_NewLogEntry, -1, _YPOS_MESSAGE_LOGENTRY, "font_old_10_white.tga", _TIME_MESSAGE_LOGENTRY);
        Snd_Play("LogEntry");
    };
    ```

## `Log_SetTopicStatus`
Changes the status of the topic with the name `topicName`

```dae
func void Log_SetTopicStatus(var string topicName, var int status) {};
```
**Parameters**

- `#!dae var string topicName`   
    Unique string used to identify and name the topic
- `#!dae var int status`   
    The status to be set.  
    Takes constants `LOG_RUNNING`, `LOG_SUCCESS`, `LOG_FAILED`, `LOG_OBSOLETE` as values


## zParserExtender
The log external function selection is missing functions to retrieve the status of a log entry. There are only functions to read the log status (as discussed on [Inside Gothic](https://ataulien.github.io/Inside-Gothic/QuestLog/)). As a result of this the original scriptwriters had to define additional variable to track the log status in the scripts, even though the value is being already tracked by the engine. 
zParserExtender fixes this by introducing new [log external functions](../extenders/zparserextender/externals/log/).


## Externals with docu comments

```dae
/// Creates a new log topic with the name `topicName` under the section `logSection`
/// 
/// @param topicName unique string used to identifiy and name the topic
/// @param logSection [LOG_MISSION, LOG_NOTE] indicates in which section to create the topic in
func void Log_CreateTopic(var string topicName, var int logSection) {};

/// Creates a new log topic with the name `topicName` under the section `logSection`
/// 
/// @param topicName unique string used to identifiy and name the topic
/// @param logSection [LOG_MISSION, LOG_NOTE] indicates in which section to create the topic in
func void Log_AddEntry(var string topicName, var string entry) {};

/// Changes the status of the topic with the name `topicName`
///
/// @param topicName unique string used to identifiy and name the topic
/// @param status [LOG_RUNNING, LOG_SUCCESS, LOG_FAILED, LOG_OBSOLETE] the status to be set
func void Log_SetTopicStatus(var string topicName, var int status) {};
```
