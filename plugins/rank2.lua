
local function action_by_reply(extra, success, result)
	local hash = 'rank:'..result.to.id..':variables'
	local text = ''
		local value = redis:hget(hash, result.from.id)
		 if not value then
		    if is_admin2(result.from.id) then
		       text = text..'باباییم \n\n'
		     elseif is_admin(result.from.id) then
		       text = text..'حمال بابایی\n\n'
		     elseif is_owner2(result.from.id, result.to.id) then
		       text = text..'مالک گروهه\n\n'
		     elseif is_momod2(result.from.id, result.to.id) then
		       text = text..'حمال مالک گروه\n\n'
		 else
		       text = text..'هیچ پخی نیست\n\n'
			end
		  else
		   text = text..''..value..'\n\n'
		 end
   send_msg(extra.receiver, text, ok_cb,  true)
end

local function run(msg, matches)
local receiver = get_receiver(msg)
  local user = matches[1]
  local text = ''
if msg.reply_id then
        msgr = get_message(msg.reply_id, action_by_reply, {receiver=receiver})
      else
	  return 
	  end
	  
end

return {
  description = "Simplest plugin ever!",
  usage = "!echo [whatever]: echoes the msg",
  patterns = {
    "in kie",
	"این کیه",
  }, 
  run = run 
}
