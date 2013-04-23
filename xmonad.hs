import Control.Monad
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Gnome (gnomeConfig)
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.Minimize
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ICCCMFocus
import XMonad.Layout.Fullscreen (fullscreenEventHook, fullscreenManageHook, fullscreenFull, fullscreenFloat)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Minimize
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W

myModMask = mod1Mask

myManageHook = composeAll
    [ manageHook gnomeConfig
    , className =? "Screenruler" --> doFloat
    , className =? "Firefox" --> doF (W.shift "web")
    , className =? "Chromium-browser" --> doF (W.shift "web")
    , className =? "Gajim" --> doF (W.shift "chat")
    , className =? "Skype" --> doF (W.shift "chat")
    , className =? "Thunderbird" --> doF (W.shift "mail")
    , className =? "Rhythmbox" --> doF (W.shift "media")
    ]
    <+>
    composeOne [ isFullscreen -?> doFullFloat ]

main = xmonad $ gnomeConfig { 
    focusFollowsMouse = True,
    manageHook = myManageHook <+> fullscreenManageHook,
    layoutHook = (fullscreenFloat . fullscreenFull) $ smartBorders $ minimize $ layoutHook gnomeConfig,
    handleEventHook = handleEventHook gnomeConfig <+> fullscreenEventHook <+> minimizeEventHook,
    workspaces = ["web", "chat", "mail", "media", "offshore"]
    } 
    `additionalKeys`
        [ ((myModMask, xK_m), withFocused minimizeWindow)
        , ((myModMask .|. shiftMask, xK_m), sendMessage RestoreNextMinimizedWin) 
        , ((myModMask, xK_adiaeresis), nextWS)
        , ((myModMask, xK_odiaeresis), prevWS)
        , ((myModMask .|. shiftMask, xK_adiaeresis), shiftToNext)
        , ((myModMask .|. shiftMask, xK_odiaeresis), shiftToPrev)
        ]
