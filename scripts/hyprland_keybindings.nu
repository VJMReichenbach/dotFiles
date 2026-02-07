def modmask-to-mods [mask: int] {
  mut mods = []

  # Check each bit and append to list
  if ($mask bit-and 1) != 0 { $mods ++= ["SHIFT"] }
  if ($mask bit-and 2) != 0 { $mods ++= ["CAPS"] }
  if ($mask bit-and 4) != 0 { $mods ++= ["CTRL"] }
  if ($mask bit-and 8) != 0 { $mods ++= ["ALT"] }
  if ($mask bit-and 16) != 0 { $mods ++= ["MOD2"] }
  if ($mask bit-and 32) != 0 { $mods ++= ["MOD3"] }
  if ($mask bit-and 64) != 0 { $mods ++= ["SUPER"] }
  if ($mask bit-and 128) != 0 { $mods ++= ["MOD5"] }

  # Join modifier names or return "NONE"
  if ($mods | length) > 0 {
    $mods | str join " + "
  } else {
    "NONE"
  }
}

let binds = hyprctl binds -j | from json | select modmask key description | where description != ""

$binds | update modmask {|row| modmask-to-mods $row.modmask}
