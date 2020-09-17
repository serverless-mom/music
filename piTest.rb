# Welcome to Sonic Pi

in_thread do
  sleep 4
  loop do
    use_synth :saw
    use_synth :fm if one_in(12)
    play 72, amp: 0.1, attack: 0.1, release: 1
    play 48, amp: rrand(0.2,0.4), release: 2 if one_in(6)
    play 53, amp: 0.3, release: 2 if one_in(2)
    play 69, amp: rrand(0.2,0.4), release: 2 if one_in(3)
    play 60, amp: 0.3, release: 2 if one_in(4)
    play 62, amp: 0.3, attack: 0.1, release: 2 if one_in(4)
    sleep 0.5
    play 60, amp: 0.2, release: 2 if one_in(4)
    play 62, amp: 0.1, attack: 0.1, release: 2 if one_in(4)
    sleep 0.25
  end
end
in_thread do
  loop do
    cue:tick
    sample :drum_heavy_kick, amp: rrand(0.6,0.7)
    sleep 0.25
    if one_in(2)
      sample :drum_cymbal_closed
    else
      sample :drum_cymbal_closed, amp: 0.1
    end
    sleep 0.25
    sample :drum_heavy_kick, amp: rrand(0.6,0.7)
    
    sleep 0.5
    sample :drum_snare_soft, amp: rrand(0.6,0.7)
    sleep 0.25
  end
end
