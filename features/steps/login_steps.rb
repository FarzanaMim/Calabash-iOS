Given(/^the app has launched$/) do
  wait_for do
    !query("*").empty?
  end
end

def tap_alert_button(button_title)
  btn = query("all button").first
  touch(btn)
end

Given(/^Give I type Username and Password$/) do
  touch('textField index:0')
  set_text('textField index:0', 'Meraj')
  sleep 0.5
  touch('textField index:1')
  set_text('textField index:1', 'Secret')
end
