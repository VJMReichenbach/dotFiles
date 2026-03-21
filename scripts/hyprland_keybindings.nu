def modmask-to-mods [mask: int] {
  mut mods = []

  # Check each bit and append to list
  if ($mask bit-and 64) != 0 { $mods ++= ["SUPER"] } # Super should be displayed first
  if ($mask bit-and 1) != 0 { $mods ++= ["SHIFT"] }
  if ($mask bit-and 2) != 0 { $mods ++= ["CAPS"] }
  if ($mask bit-and 4) != 0 { $mods ++= ["CTRL"] }
  if ($mask bit-and 8) != 0 { $mods ++= ["ALT"] }
  if ($mask bit-and 16) != 0 { $mods ++= ["MOD2"] }
  if ($mask bit-and 32) != 0 { $mods ++= ["MOD3"] }
  if ($mask bit-and 128) != 0 { $mods ++= ["MOD5"] }

  # Join modifier names or return "NONE"
  if ($mods | length) > 0 {
    $mods | str join " + "
  } else {
    ""
  }
}

# replace key names with better descriptions
def replace-key-names [key: string] {
  if $key == "mouse_down" {return "Scroll Down"}
  if $key == "mouse_up" {return "Scroll Up"}
  if $key == "mouse:272" {return "Left Click"}
  if $key == "mouse:273" {return "Right Click"}
  if $key == "XF86PowerOff" {return "Power Button"}
  return $key
}

def create-wofi-text [tab: table] {
  $tab | each { 
    |row|
      let mod = $row.modmask
      let key = $row.key
      let desc = $row.description

      let keycombo = [$mod $key] | str join " + " 
      $keycombo | $"($in)     →     ($desc)"
    } | str join "\n"
}

let binds = hyprctl binds -j | from json | select modmask key description | where description != ""
let binds = $binds | update modmask {|row| modmask-to-mods $row.modmask}
let binds = $binds | update key {|row| replace-key-names $row.key}

let text = create-wofi-text $binds

$text | wofi --show dmenu --insensitive --width=60% --height=60%
