def chordPlay(root, quality = :major)
  play chord(root, quality)
end


loop do
  cue :tick
  use_synth :pluck
  use_synth :beep
  chords = [:g, :g, :b, :g, :b, :g, :b, :c, :g]
  chords.each {|c|
    chordPlay c
    sleep 1
    
  }
  
  
  
end

