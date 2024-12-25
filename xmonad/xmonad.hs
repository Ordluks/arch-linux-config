import XMonad
import XMonad.Util.EZConfig

terminalApp :: String
terminalApp = "kityy"

launcherApp :: String
launcherApp = "rofi -show drun -show-icons"

main :: IO ()
main =
  xmonad $
    def
      { terminal = "kitty",
        modMask = mod4Mask,
        normalBorderColor = "#0000ff"
      }
      `additionalKeys` [ ((mod4Mask, xK_d), spawn launcherApp)
                       ]
