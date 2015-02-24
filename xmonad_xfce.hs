import Control.Monad
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Config.Xfce
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Minimize
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ICCCMFocus
import XMonad.Layout.Fullscreen (fullscreenEventHook, fullscreenManageHook, fullscreenFull, fullscreenFloat)
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.Minimize
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W

myModMask = mod1Mask

myManageHook = composeAll
    [ manageHook xfceConfig
    , className =? "Xfrun4" --> doCenterFloat
    , className =? "Screenruler" --> doFloat
    , className =? "Firefox" --> doF (W.shift "web")
    , className =? "Chromium-browser" --> doF (W.shift "web")
    , className =? "Pidgin" --> doF (W.shift "chat")
    , className =? "Skype" --> doF (W.shift "chat")
    , className =? "Thunderbird" --> doF (W.shift "mail")
    , className =? "Rhythmbox" --> doF (W.shift "media")
    , className =? "Spotify" --> doF (W.shift "media")
    , className =? "Eclipse" --> doF (W.shift "dev")
    ]
    <+>
    composeOne [ isFullscreen -?> doFullFloat ]

defaultLayouts = smartBorders( desktopLayoutModifiers (Tall 1 (3/100) (1/2) ||| noBorders Full) )

myLayouts = minimize $ defaultLayouts

main = xmonad $ xfceConfig { 
    focusFollowsMouse = True,
    manageHook = myManageHook <+> fullscreenManageHook,
    layoutHook = myLayouts,
    handleEventHook = handleEventHook xfceConfig <+> fullscreenEventHook <+> minimizeEventHook,
    workspaces = ["web", "chat", "mail", "dev", "offshore", "media"]
    } 
    `additionalKeys`
        [ ((myModMask, xK_m), withFocused minimizeWindow)
        , ((myModMask .|. shiftMask, xK_m), sendMessage RestoreNextMinimizedWin) 
        , ((myModMask, xK_semicolon), prevWS)
        , ((myModMask, xK_apostrophe), nextWS)
        , ((myModMask .|. shiftMask, xK_adiaeresis), shiftToNext)
        , ((myModMask .|. shiftMask, xK_odiaeresis), shiftToPrev)
        ]
