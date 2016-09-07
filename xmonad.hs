import Control.Monad
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Config.Gnome (gnomeConfig)
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
    [ manageHook gnomeConfig
    , className =? "Screenruler" --> doFloat
    , className =? "Firefox" --> doF (W.shift "web")
    , className =? "Chromium-browser" --> doF (W.shift "web")
    , className =? "Pidgin" --> doF (W.shift "chat")
    , className =? "Skype" --> doF (W.shift "chat")
    , className =? "Thunderbird" --> doF (W.shift "mail")
    , className =? "Rhythmbox" --> doF (W.shift "media")
    , className =? "Spotify" --> doF (W.shift "media")
    ]
    <+>
    composeOne [ isFullscreen -?> doFullFloat ]

defaultLayouts = smartBorders( desktopLayoutModifiers (Tall 1 (3/100) (1/2) ||| Grid ||| noBorders Full) )

{-
myLayouts = (fullscreenFloat . fullscreenFull) $ defaultLayouts $ minimize $ layoutHook gnomeConfig
-}
myLayouts = minimize $ defaultLayouts

main = xmonad $ gnomeConfig { 
    focusFollowsMouse = True,
    manageHook = myManageHook <+> fullscreenManageHook,
    layoutHook = myLayouts,
    handleEventHook = handleEventHook gnomeConfig <+> fullscreenEventHook <+> minimizeEventHook,
    workspaces = ["web", "chat", "mail", "offshore", "media"],
    startupHook = startupHook gnomeConfig
    } 
    `additionalKeys`
        [ ((myModMask, xK_m), withFocused minimizeWindow)
        , ((myModMask, xK_p), spawn "GTK_IM_MODULE='' synapse") 
        , ((myModMask .|. shiftMask, xK_m), sendMessage RestoreNextMinimizedWin) 
        , ((myModMask, xK_semicolon), prevWS)
        , ((myModMask, xK_apostrophe), nextWS)
        , ((myModMask .|. shiftMask, xK_adiaeresis), shiftToNext)
        , ((myModMask .|. shiftMask, xK_odiaeresis), shiftToPrev)
        ]
