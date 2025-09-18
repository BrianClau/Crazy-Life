function onUpdate(elapsed)
    local songPos = getSongPosition()
    local floatY = math.sin(songPos * 0.003) * 20
    setProperty('boyfriend.y', 700 + floatY)
end