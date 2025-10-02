local aureolaxpos = 890
local aureolaypos = 25
local alaslaxpos = 830
local alaslaypos = 35
local aureolaVisible = false
local lossLife = true
local lossLife2 = true

function onCreatePost()
   -- makeLuaSprite('aureola', 'saveMode/aureola', aureolaxpos, aureolaypos);
   -- setObjectCamera('aureola', 'hud');
   -- setBlendMode('aureola','add');
   -- addLuaSprite('aureola', true);
   -- setProperty('aureola.alpha', 0);

   -- makeLuaSprite('alas', 'saveMode/alas', alaslaxpos, alaslaypos);
   -- setObjectCamera('alas', 'hud');
   -- addLuaSprite('alas', true);
   -- setProperty('alas.alpha', 0);
end

function onUpdatePost()
   health = getProperty('health');
   local shouldBeVisible = (rating < 0.80 and misses >= 1)

   if shouldBeVisible ~= aureolaVisible then
      aureolaVisible = shouldBeVisible

      if shouldBeVisible then
         -- cancelTween('aureolabye');
         -- cancelTween('alasbye');
         -- doTweenAlpha('aureolaTween', 'aureola', 1, 2, 'backOut');
         -- doTweenY('Start', 'aureola', aureolaypos + 7, 4, 'quadInOut');

         -- doTweenAlpha('alasTween', 'alas', 1, 2, 'backOut');
         -- doTweenY('StartA', 'alas', alaslaypos + 5, 4.01, 'quadInOut');
         lossLife2 = false
      else
         -- cancelTween('aureolaTween');
         -- cancelTween('alasTween');
         -- doTweenAlpha('aureolabye', 'aureola', 0, 2, 'backOut');
         -- doTweenAlpha('alasbye', 'alas', 0, 2, 'backOut');
         lossLife2 = true
      end
   end

   if getProperty('health') > 0.35 then
      lossLife = true
   else
      lossLife = false
   end
end

-- function onTweenCompleted(tag)
--    if tag == 'Start' then
--       doTweenY('Start2', 'aureola', aureolaypos - 5, 4, 'quadInOut');
--    end
--    if tag == 'Start2' then
--       doTweenY('Start', 'aureola', aureolaypos + 5, 4, 'quadInOut');
--    end
--    if tag == 'StartA' then
--       doTweenY('Start2A', 'alas', alaslaypos - 10, 4.01, 'quadInOut');
--    end
--    if tag == 'Start2A' then
--       doTweenY('StartA', 'alas', alaslaypos + 10, 4.01, 'quadInOut');
--    end
--    if tag == 'aureolabye' then
--          cancelTween('Start');
--          cancelTween('Start2');
--          cancelTween('StartA');
--          cancelTween('Start2A');

--          setProperty('aureola.y', aureolaypos);
--          setProperty('alas.y', alaslaypos);
--    end
-- end

function opponentNoteHit()
   if lossLife == true and lossLife2 == true then
      setProperty('health', health - 0.010);
   end
end