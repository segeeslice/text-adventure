# Text Adventure

The goal for this project as of now is to be a text-based adventure game **framework** in which anyone can download and play their own adventures. Users could simply run someone else's adventure or create their own.

A text adventure will likely be formatted via a series of [JSON](https://www.w3schools.com/whatis/whatis_json.asp) files. For example, traveling to a new area will simply mean loading an JSON object from a new file. The files will likely reference each other by name.

With a format like this, the primary key is wide-scale organization, which I hope to get some practice with through this project. Even if this project reaches no one, I want it to be framed as if it could be used by anyone. Perhaps I could even add a utility later to assist with the making of JSON files, although it is currently out of scope.

Stay tuned. :)

___
## Running an adventure (TBD)
Simply click on the loading icon and find the starting file for your adventure. If they made the format correctly, the adventure should run from there.

Use the main buttons to make selections, and use the back button to go back to a previous location (if it's enabled).
___
## Adventure Creation (TBD)

The program utilizes [JSON](https://www.w3schools.com/whatis/whatis_json.asp) files in order to run an adventure. It's recommended that you remotely understand how this works, but it is not required since this format is designed to be human-readable.

Just know that the although the format and syntax is fairly simple, exactness is very important. Just like code, one small error can break the whole system. It is recommended to simply copy and paste the base format for each file and only modify the contents of each field. Let's start with some background...

#### General program layout
The top area of the program is called the `mainText`. The large, main buttons are numbered in normal reading order (left&rarr;right, top&rarr;down) from one to four. These are formatted like `button1`, `button2`, etc.

The back button is located in the middle, and this only correlates to `backEnable` (explained later). This button is intended to bring the player back to where they were one step ago. This can be used multiple times to go back multiple steps.

For a visual representation:

*Insert basic visual image*

#### Example file format
*(A proper example of file formatting can be found within the demo folder.)*

```
{
  "mainText": "The text to be displayed in the main area",
  "button1": {
    "text": "The text to be displayed in the first (top left) button",
    "dest": "The file name we should travel to when this button is clicked"
  },
  "button2": {
    "text": "The text to be displayed in second (top right) button",
    "dest": "The file name we should travel to when this button is clicked"
  },
  "button3": {
    "text": "The text to be displayed in third (bottom left) button",
    "dest": "The file name we should travel to when this button is clicked"
  },
  "button4": {
    "text": "The text to be displayed in fourth (bottom right) button",
    "dest": "The file name we should travel to when this button is clicked"
  },
  "backEnable": true
}
```

**Important format notes**:
- To display nothing in a button, simply omit the item entirely. The button will appear blank and nothing will happen when it is clicked.
- If `backEnable` is set to `true`, the player can use the back button to visit the previous file. If set to `false`, the path backwards will be broken.
  - This allows for dynamic pathing and control.
  - For example, while walking up to a haunted house, a player could have the ability to walk backwards at any time since it is just a path. This would mean `backEnable` would be set to `true`. However, if they step inside and the door locks behind them, we could set `backEnable` to `false` as they cannot just go back outside. Setting it back to `true` after this point would allow them to go back to the front door, but no further.

#### File organization
The program currently expects all files to be in the **same directory as the starting file**. This may change in the future, especially if a need for larger adventures arises.

While there is no restriction on naming conventions, it is recommended that you keep your files organized by file name. For example, a straight path across a bridge could be in order via "bridge01.json", "bridge02.json", etc.

#### The future of these adventures
As of right now, **you can only adventure between places.** Eventually, I hope to add things like:

- Inventory
- Player info (health, mana, weight)
- Battles

I also may add other core elements to make stories **dynamic based on character choices or attributes**. For example, a character carrying too much may actually break a bridge they walk across or be unable to climb a ladder. This would be an additional functionality of the json file, although nothing is set in stone yet.
