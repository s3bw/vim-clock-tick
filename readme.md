<h1 align="center">
    Vim Clock Tick
</h1>

<p align="center">
    Add a ticking clock face to <a href="https://github.com/enricobacis/vim-airline-clock">airline-clock</a>
</p>

<p align="center">
    <img src="https://raw.githubusercontent.com/GiantsLoveDeathMetal/vim-clock-tick/master/.screenshot/clock_shot.png"/>
</p>

## Why?

Having a clock in vim is helpful when you're working in full screen. Adding the icon just serves as an indication that you're looking at the time. There is no reason for having it animated.

## Installing

Using pathogen, clone into `~/.vim/bundles/vim-clock-tick`

## Configuration

 * Changing the clock format

    ```vim
    let g:airline#extensions#clock_tick#format = '%H:%M:%S'
    ```

 * The tick speed by default depends on the hour. To change it to minutes use `'M'` and seconds use `'S'`.

    ```vim
    let g:airline#extensions#clock_tick#delta = 'S'
    ```
