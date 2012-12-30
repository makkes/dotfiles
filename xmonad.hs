import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Gnome (gnomeConfig)
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Fullscreen (fullscreenEventHook, fullscreenManageHook, fullscreenFull, fullscreenFloat)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W

myModMask = mod1Mask

myManageHook = composeAll
    [ manageHook gnomeConfig
    , className =? "Screenruler" --> doFloat
    , className =? "Firefox" --> doF (W.shift "1")
    , className =? "Gajim" --> doF (W.shift "2")
    , className =? "Skype" --> doF (W.shift "2")
    , className =? "Thunderbird" --> doF (W.shift "3")
    , className =? "Rhythmbox" --> doF (W.shift "4")
    ]
    <+>
    composeOne [ isFullscreen -?> doFullFloat ]

main = xmonad $ gnomeConfig { 
      manageHook = myManageHook <+> fullscreenManageHook
    , layoutHook = (fullscreenFloat . fullscreenFull) $ smartBorders $ layoutHook gnomeConfig
    , handleEventHook = handleEventHook gnomeConfig <+> fullscreenEventHook
    } 
    `additionalKeys`
        [ ((myModMask, xK_adiaeresis), nextWS)
        , ((myModMask, xK_odiaeresis), prevWS)
        , ((myModMask .|. shiftMask, xK_adiaeresis), shiftToNext)
        , ((myModMask .|. shiftMask, xK_odiaeresis), shiftToPrev)
        ]
