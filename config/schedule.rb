# CHANGE STATUS AUTOMATICALLY
every 1.day, at: '00:01 am' do
  runner 'Contract.auto_change_status'
end