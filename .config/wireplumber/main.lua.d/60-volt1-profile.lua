rule = {
  matches = {
    {
      -- Match the ALSA card device properties
      { "device.name", "matches", "alsa_card.usb-Universal_Audio_Volt_1_22442036033556-00" }, -- <-- ADJUST THIS PATTERN
    },
  },
  apply_properties = {
    -- Set the desired profile by its name
    ["device.profile"] = "output:analog-stereo+input:analog-stereo", -- <-- REPLACE WITH YOUR PROFILE NAME
  },
}
table.insert(alsa_monitor.rules, rule)


