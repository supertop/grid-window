# Supertop Grid

A grid overlay for iOS apps. 

Use this during the development of your app to help align your interface to a grid, and 
easily spot layout issues. It will overlay every view in your app, but not interfere with
interaction, so you can still move around.

The included example app

## How To Use

1. Add SUPGridWindow and SUPGridView to your project.
2. Configure the grid size and color.
3. Optionally add a gesture to toggle the grid on or off.

Example
-------

```
	SUPGridWindow *grid = [SUPGridWindow sharedGridWindow];
	
	[grid setGridColor:[UIColor redColor]];
	[grid setMajorGridSize:CGSizeMake(40, 40)];
	[grid setMinorGridSize:CGSizeMake(10, 10)];
```

Screenshots
-----------

![The Grid](https://raw.githubusercontent.com/supertop/grid-window/master/thegrid.png?1 "I tried to picture clusters of information")
![The Grid](https://raw.githubusercontent.com/supertop/grid-window/master/grid2.png?1)

Notes
-----

* This is a development tool. You probably want to make sure you don't ship with this. The 
window is added above all others, so it will even overlay notifications. Apple doesn't like 
that.

* The right gesture to toggle the grid will vary app to app, so we didn't set any by default.

To Do
-----

* The ability to scroll the grid along with scrollviews.
