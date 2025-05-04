# Log functions
As discussed on [Inside Gothic](https://ataulien.github.io/Inside-Gothic/QuestLog/), vanilla Gothic has no way of getting the status of a quest. These functions implement that functionality.

## `Log_GetTopicStatus`
!!! function "`Log_GetTopicStatus`"
    Returns the status of diary topic

    - `-1` - Not found
    - `0` - Free
    - `1` - Running
    - `2` - Success
    - `3` - Failure
    - `4` - Obsolete

    ```dae
    func int Log_GetTopicStatus(var string topic) {};
    ```

    - `topic` - name of the topic
    - `return` - topic status

## `Log_GetTopicSection`
!!! function "`Log_GetTopicSection`"
    Returns the topic the diary topic is in

    - `-1` - Not found
    - `0` - Missions
    - `1` - Notes
    - `2` - All

    ```dae
    func int Log_GetTopicSection(var string topic) {};
    ```

    - `topic` - name of the topic
    - `return` - topic section
