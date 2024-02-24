# zCCodeMaster

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCCodeMaster`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `0`<br/>
    — Gothic II: `0`<br/>
    **Source:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/zccodemaster/1-1-0-526)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/zCCodeMaster/)

`zCCodeMaster` VObjects keep a list of 'slave' VObjects and keep track of events received by them. If the master
receives an `OnTrigger` event from a slave, it remembers that it did. After it has receives an `OnTrigger` message
from all slaves, it emits an `OnTrigger` event to the [`triggerTarget`](index.md#triggertarget). Receiving or sending an
`OnTrigger` event is also referred to as an 'activation' for this purpose.

=== "Gothic 1"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - [*zCTriggerBase*](zCTriggerBase.md)
      {: .sp-class}
    - zCCodeMaster
      {: .sp-class}
        - CodeMaster
          {: .sp-folder}
            - [orderRelevant](#orderrelevant) = FALSE
              {: .sp-bool}
            - OrderRelevant
              {: .sp-folder}
                - [firstFalseIsFailure](#firstfalseisfailure) = TRUE
                  {: .sp-bool}
                - [triggerTargetFailure](#triggertargetfailure) = ""
                  {: .sp-string}
            - OrderNotRelevant
              {: .sp-folder}
                - [untriggerCancels](#untriggercancels) = FALSE
                  {: .sp-bool}
            - [slaveVobName](#slavevobname) ... = ""
              {: .sp-string}

=== "Gothic 2"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - [*zCTriggerBase*](zCTriggerBase.md)
      {: .sp-class}
    - zCCodeMaster
      {: .sp-class}
        - CodeMaster
          {: .sp-folder}
            - [orderRelevant](#orderrelevant) = FALSE
              {: .sp-bool}
            - OrderRelevant
              {: .sp-folder}
                - [firstFalseIsFailure](#firstfalseisfailure) = TRUE
                  {: .sp-bool}
                - [triggerTargetFailure](#triggertargetfailure) = ""
                  {: .sp-string}
            - OrderNotRelevant
              {: .sp-folder}
                - [untriggerCancels](#untriggercancels) = FALSE
                  {: .sp-bool}
            - [slaveVobName](#slavevobname) ... = ""
              {: .sp-string}

=== "Gothic 1 (Save)"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - [*zCTriggerBase*](zCTriggerBase.md)
      {: .sp-class}
    - zCCodeMaster
      {: .sp-class}
        - CodeMaster
          {: .sp-folder}
            - [orderRelevant](#orderrelevant) = FALSE
              {: .sp-bool}
            - OrderRelevant
              {: .sp-folder}
                - [firstFalseIsFailure](#firstfalseisfailure) = TRUE
                  {: .sp-bool}
                - [triggerTargetFailure](#triggertargetfailure) = ""
                  {: .sp-string}
            - OrderNotRelevant
              {: .sp-folder}
                - [untriggerCancels](#untriggercancels) = FALSE
                  {: .sp-bool}
            - [slaveVobName](#slavevobname) ... = ""
              {: .sp-string}

=== "Gothic 2 (Save)"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - [*zCTriggerBase*](zCTriggerBase.md)
      {: .sp-class}
    - zCCodeMaster
      {: .sp-class}
        - CodeMaster
          {: .sp-folder}
            - [orderRelevant](#orderrelevant) = FALSE
              {: .sp-bool}
            - OrderRelevant
              {: .sp-folder}
                - [firstFalseIsFailure](#firstfalseisfailure) = TRUE
                  {: .sp-bool}
                - [triggerTargetFailure](#triggertargetfailure) = ""
                  {: .sp-string}
            - OrderNotRelevant
              {: .sp-folder}
                - [untriggerCancels](#untriggercancels) = FALSE
                  {: .sp-bool}
            - [slaveVobName](#slavevobname) ... = ""
              {: .sp-string}
            - [numSlavesTriggered](#numslavestriggered) = 0
              {: .sp-int}
            - slaveTriggered ... = NULL
              {: .sp-class}

## Class member overview

### `orderRelevant` {: .sp-bool}

Controls whether the master should keep track of the order it receives messages from its slaves.

**Accepted values:**
    
* `TRUE` — Only send an `OnTrigger` event to the [`triggerTarget`](index.md#triggertarget) if the slaves have fired in
  the exact order they are configured here. Also counts multiple activations.
* `FALSE` — Send an `OnTrigger` event to the [`triggerTarget`](index.md#triggertarget) after all slaves have fired at least
  once, regardless of order.

### `firstFalseIsFailure` {: .sp-bool}

Controls when the slave activation sequence is considered to be incorrect. After the sequence is marked as
incorrect an `OnTrigger` event is sent to [`triggerTargetFailure`](#triggertargetfailure).

**Accepted values:**
    
* `TRUE` — The sequence is considered to be incorrect as soon as one slave is activated out-of-order.
* `FALSE` — The sequence is considered to be incorrect only after all slaves have been activated at least once and
  they were activated out-of-order.

!!! warning
    Only relevant if [`orderRelevant`](#orderrelevant) is set to `TRUE`.

### `triggerTargetFailure` {: .sp-string}

The name of the VObject to emit an `OnTrigger` event to if the activation sequence fails. This is controlled by
[`firstFalseIsFailure`](#firstfalseisfailure).

!!! warning
    Only relevant if [`orderRelevant`](#orderrelevant) is set to `TRUE`.

### `untriggerCancels` {: .sp-bool}

Controls whether slaves can emit `OnUntrigger` events to the master VObject to mark themselves as deactivated.

**Accepted values:**

* `TRUE` — When the master receives an `OnUntrigger` event from the slave, it marks it as not having been activated.
* `FALSE` — The master ignore `OnUntrigger` events from its slaves.

!!! warning
    Only relevant if [`orderRelevant`](#orderrelevant) is set to `FALSE`.

### `slaveVobName` {: .sp-string}

The name of a slave VObject.

### `numSlavesTriggered` {: .sp-int}

Unknown.

!!! warning
    This property is only available in saved games.
