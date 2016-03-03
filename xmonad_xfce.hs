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
import XMonad.Layout.PerWorkspace
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W

myModMask = mod1Mask

myManageHook = composeAll
    [ manageHook xfceConfig
    , resource  =? "synapse"          --> doIgnore
    , className =? "Xfrun4"           --> doCenterFloat
    , className =? "Kruler"      --> doFloat
    , className =? "Wrapper"      --> doFloat
    , className =? "Firefox"          --> doF (W.shift "web")
    , (className =? "Firefox" <&&> resource =? "Browser") --> doFloat
    , (className =? "Firefox" <&&> title =? "Inspect Network Request") --> (ask >>= doF . W.sink)
    , className =? "Chromium-browser" --> doF (W.shift "work")
    , className =? "Eclipse"          --> doF (W.shift "eclipse")
    ]
    <+>
    composeOne [ isFullscreen -?> doFullFloat ]

defaultLayouts = smartBorders( desktopLayoutModifiers (Tall 1 (3/100) (1/2) ||| noBorders Full) )
flexibleLayout = smartBorders $ desktopLayoutModifiers(Grid)

myLayouts = minimize $ defaultLayouts

main = do
    spawn "/usr/bin/xcompmgr -n"

    xmonad $ xfceConfig {
    focusFollowsMouse = True,
    manageHook = myManageHook <+> fullscreenManageHook,
    layoutHook = onWorkspace "terminals1" flexibleLayout $ myLayouts,
    handleEventHook = handleEventHook xfceConfig <+> fullscreenEventHook <+> minimizeEventHook,
    workspaces = ["work", "personal", "virtualbox", "eclipse", "terminals1", "terminals2", "terminals3"]
    } `additionalKeys`
        [ ((myModMask, xK_m), withFocused minimizeWindow)
        , ((myModMask, xK_p), spawn "synapse") 
        , ((myModMask .|. shiftMask, xK_m), sendMessage RestoreNextMinimizedWin) 
        , ((myModMask, xK_semicolon), prevWS)
        , ((myModMask, xK_apostrophe), nextWS)
        , ((myModMask .|. shiftMask, xK_adiaeresis), shiftToNext)
        , ((myModMask .|. shiftMask, xK_odiaeresis), shiftToPrev)
        ]
