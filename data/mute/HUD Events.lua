--Made by: Angeliu Gamer: https://twitter.com/AngeliuGamerCA

function onCreatePost()
        noteTweenX('defaultPlayerStrumX0', 4, 420, 0.5, ' linear')
        noteTweenX('defaultPlayerStrumX1', 5, 535, 0.5, ' linear')
        noteTweenX('defaultPlayerStrumX2', 6, 645, 0.5, ' linear')   
        noteTweenX('defaultPlayerStrumX3', 7, 760, 0.5, ' linear')
    
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)

        setProperty("healthBar.alpha", 0)
        setProperty("iconP1.alpha", 0)
        setProperty("iconP2.alpha", 0)

        --noteTweenY('defaultPlayerStrumYf', 4, 50, 0.5, 'linear')
    --noteTweenY('defaultPlayerStrumYg', 5, 50, 0.5, 'linear')
    --noteTweenY('defaultPlayerStrumYh', 6, 50, 0.5, 'linear')
    --noteTweenY('defaultPlayerStrumYi', 7, 50, 0.5, 'linear')
end

function onUpdate()
	if curStep == 1 then
              noteTweenAlpha('defaultOpponentStrumX0', 0, 0, 0.01, 'linear')
              noteTweenAlpha('defaultOpponentStrumX1', 1, 0, 0.01, 'linear')
              noteTweenAlpha('defaultOpponentStrumX2', 2, 0, 0.01, 'linear')
                noteTweenAlpha('defaultOpponentStrumX3', 3, 0, 0.01, 'linear')
                
                 doTweenAlpha('inGame','camGame', 1, 0.4, 'quadInOut')

               noteTweenX('defaultOpponentStrumX0', 0, -150, 0.01, 'linear')
               noteTweenX('defaultOpponentStrumX1', 1, -150, 0.01, 'linear')
               noteTweenX('defaultOpponentStrumX2', 2, -150, 0.01, 'linear')
               noteTweenX('defaultOpponentStrumX3', 3, -150, 0.01, 'linear')
               doTweenAlpha('inscoreTxt','scoreTxt', 0, 0.01, 'quadInOut')
	end
        
        if curStep == 110 then
                doTweenAlpha('inHUD','camHUD', 1, 0.6, 'quadInOut')
        end

        if curStep == 256 then
                noteTweenAlpha('defaultOpponentStrumX0', 0, 1, 0.8, 'linear')
                noteTweenAlpha('defaultOpponentStrumX1', 1, 1, 0.8, 'linear')
                noteTweenAlpha('defaultOpponentStrumX2', 2, 1, 0.8, 'linear')
                noteTweenAlpha('defaultOpponentStrumX3', 3, 1, 0.8, 'linear')

                noteTweenX('defaultPlayerStrumX0', 0, 100, 1, 'quadInOut')
                noteTweenX('defaultPlayerStrumX1', 1, 220, 1, 'quadInOut')
                noteTweenX('defaultPlayerStrumX2', 2, 340, 1, 'quadInOut')
                noteTweenX('defaultPlayerStrumX3', 3, 460, 1, 'quadInOut')

                noteTweenX('defaultOpponentStrumX0', 4, 700, 1, ' quadInOut')
                noteTweenX('defaultOpponentStrumX1', 5, 820, 1, ' quadInOut')
                noteTweenX('defaultOpponentStrum2', 6, 940, 1, ' quadInOut')
                noteTweenX('defaultOpponentStrumX3', 7, 1060, 1, ' quadInOut')

                doTweenAlpha('inhealthBar','healthBar', 1, 0.6, 'quadInOut')
                doTweenAlpha('iniconP1','iconP1', 1, 0.6, 'quadInOut')
                doTweenAlpha('iniconP2','iconP2', 1, 0.6, 'quadInOut')
                doTweenAlpha('inscoreTxt','scoreTxt', 1, 6, 'quadInOut')
        end


        if curStep == 2048 then
		noteTweenX('defaultPlayerStrumX0', 4, 1500, 3, ' quadInOut')
                noteTweenX('defaultPlayerStrumX1', 5, 1500, 3, ' quadInOut')
                noteTweenX('defaultPlayerStrumX2', 6, 1500, 3, ' quadInOut')   
                noteTweenX('defaultPlayerStrumX3', 7, 1500, 3, ' quadInOut')

                noteTweenAlpha('defaultOpponentStrumX0', 0, 0, 0.01, 'quadInOut')
                noteTweenAlpha('defaultOpponentStrumX1', 1, 0, 0.01, 'quadInOut')
                noteTweenAlpha('defaultOpponentStrumX2', 2, 0, 0.01, 'quadInOut')
                noteTweenAlpha('defaultOpponentStrumX3', 3, 0, 0.01, 'quadInOut')

                setProperty("healthBar.alpha", 0)
                setProperty("iconP1.alpha", 0)
                setProperty("iconP2.alpha", 0)
                doTweenAlpha('inscoreTxt','scoreTxt', 0, 0.01, 'quadInOut')
	end

	if curStep == 2176 then
		noteTweenX('defaultPlayerStrumX0', 4, 420, 2, 'quadInOut')
                noteTweenX('defaultPlayerStrumX1', 5, 535, 2, 'quadInOut')
                noteTweenX('defaultPlayerStrumX2', 6, 645, 2, 'quadInOut') 
                noteTweenX('defaultPlayerStrumX3', 7, 760, 2, 'quadInOut')

                doTweenAlpha('inhealthBar','healthBar', 1, 6, 'quadInOut')
                doTweenAlpha('iniconP1','iconP1', 1, 6, 'quadInOut')
                doTweenAlpha('iniconP2','iconP2', 1, 6, 'quadInOut')
                doTweenAlpha('inscoreTxt','scoreTxt', 1, 6, 'quadInOut')
                doTweenAlpha('inscoreTxt','scoreTxt', 1, 3, 'quadInOut')
	end

        if curStep == 3090 then
               playSound("Explosion Rivals", 0.2, tag);
        end

        

end
