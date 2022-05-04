
live_loop :ambi_main do
  sample :ambi_choir , rate: 0.2,attack: 0.1,release: 2,amp:2
  sleep sample_duration :ambi_choir
end


timer = 1
live_loop :piano_tick do
  sample :ambi_piano, release: 2, rate: 0.9 ,amp: 0.77,pan: rrand(-1,1)
  
  sleep 3 if timer %5 == 0
  sleep 1 if timer %5 != 0
  timer =timer+1
  puts timer
end

with_fx :reverb do
  live_loop :reverb_piano do
    sample :guit_em9, rate: 1, amp: 0.08, pan: rrand(-1,1)
    sleep sample_duration :guit_em9
  end
  
end


live_loop :hiss do
  sample :vinyl_hiss, amp: 0.04
  sleep sample_duration :vinyl_hiss
end

live_loop :random_ding do
  sample :ambi_swoosh,rate: 0.5,attack: 0.2,amp: 0.4
  sleep 2
end

sleep 2
with_fx :reverb do
  with_fx(:echo, delay: 0.6, decay: 6) do
    live_loop :echoes do
      sample :ambi_glass_hum, rate: -2,amp: 0.2
      sleep 12
    end
  end
end


