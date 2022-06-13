# BitmapTextureFont
A simple Godot plugin to create Bitmap Fonts from sprite sheets! ( Tested with Godot 3.4.2 )

![](/images/screenshot_1.png)

## Usage:

1. Install the plugin to your project by:
   - Downloading from AssetLib
   - Installing from .zip
   - Cloning the repo
2. Create a new Resource and look for `BitmapTextureFont`
3. Add your sprite sheet to the ***Texture*** section
4. Type out the characters as seen on the sheet from right to left into the ***Character Map*** section
   - Ensure that each character is present only once in the character map!
5. Specify the width and height of the cells in ***Size*** section
6. Optionally set spacing between characters with the ***Extra Spacing*** section
7. Optionally set if the font should be uniform or kerned with the ***Monospace*** section
8. Opitonally set custom character positions and dimensions in the ***Custom Characters*** section

## Setting up Custom Characters:

***Custom Characters*** can be set to specify the position and dimensions of character from the sprite sheet manually!

1. Expand the ***Custom Characters*** array for however many characters you wish to modify
2. Create a *Dictionary* for each entry in the array
3. Within each *Dictionary*, add the following key-value pairs:
   - Key: `Unicode` (String) / Value: `int` [ Integer value of custom character in Unicode ]
   - Key: `Position` (String) / Value: `Vector2` [ Starting position in pixels of sprite sheet ]
   - Key: `Size` (String) / Value: `Vector2` [ Size of rectangle from starting position ]

If done correctly, each entry should look like example below:

![](/images/screenshot_2.png)

## Tips:

* If things aren't looking correct with your font:
   - Check your sprite sheet to ensure that the characters are evenly spaced and fit uniformly within cells
   - Check your sprite sheet for any repeating characters ( That includes ***whitespace***! )
   - Check your settings and make sure the ***Character Map*** is typed out correctly as shown on the sprite sheet
