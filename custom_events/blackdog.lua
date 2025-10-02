local backX = -450;
local backX2 = backX - 3215;
local velocity = 4
local color = 0xA6D3FF
local bfY = getProperty('boyfriend.y')
local dadY = getProperty('dad.y')


function onCreatePost()
    makeLuaSprite('back', 'blackdog/back', backX, 0);
    setProperty('back.scale.x', 2.5);
    setProperty('back.scale.y', 2.5);
    addLuaSprite('back', false);
    setProperty('back.visible', false);

    makeLuaSprite('back2', 'blackdog/back',backX2, getProperty('back.y'));
    setProperty('back2.scale.x', 2.5);
    setProperty('back2.scale.y', 2.5);
    addLuaSprite('back2', false);
    setProperty('back2.visible', false);

    makeLuaSprite('shine', 'blackdog/shine',0, 0);
    addLuaSprite('shine', true);
    setBlendMode('shine', 'add');
    setProperty('shine.color', color);
    setObjectCamera('shine', 'other');
    setProperty('shine.alpha', 0);
end

function onEvent(name, value1, value2)
    if name == 'blackdog' and value1 == 'start' then
        setProperty('back.visible', true);
        setProperty('back2.visible', true);
        setProperty('shine.alpha', 0.69); --Numero chistoso

        setProperty('back.x', backX);
        setProperty('back2.x', backX2);

        doTweenX('backTween', 'back', getProperty('back.x') + 3215, velocity, 'none');
        doTweenX('backTween2', 'back2', getProperty('back2.x') + 3215, velocity, 'none');
        doTweenY('boyfriend1', 'boyfriend', bfY - 60, 2, 'cubeInOut');
        doTweenY('dad1', 'dad', dadY + 60, 2, 'cubeInOut');
    end

    if name == 'blackdog' and value1 == 'end' then
        setProperty('back.visible', false);
        setProperty('back2.visible', false);
        setProperty('shine.alpha', 0);

        cancelTween('boyfriend1');
        cancelTween('boyfriend2');
        cancelTween('dad1');
        cancelTween('dad2');
        cancelTween('backTween');
        cancelTween('backTween.5');
        cancelTween('backTween2');
        cancelTween('backTween2.5');

        setProperty('boyfriend.y', bfY);
        setProperty('dad.y', dadY);
    end
end

function onTweenCompleted(tag)
    if tag == 'backTween' then
        setProperty('back.x', backX2);
        doTweenX('backTween.5', 'back', getProperty('back.x') + 3215, velocity, 'none');
    end
    if tag == 'backTween2' then
        doTweenX('backTween2.5', 'back2', getProperty('back2.x') + 3215, velocity, 'none');
    end

    if tag == 'backTween.5' then
        doTweenX('backTween', 'back', getProperty('back.x') + 3215, velocity, 'none');
    end
    if tag == 'backTween2.5' then
        setProperty('back2.x', backX2);
        doTweenX('backTween2', 'back2', getProperty('back2.x') + 3215, velocity, 'none');
    end


    if tag == 'boyfriend1' then
        doTweenY('boyfriend2', 'boyfriend', bfY + 12, 2, 'cubeInOut');
    end
    if tag == 'dad1' then
        doTweenY('dad2', 'dad', dadY - 12, 2, 'cubeInOut');
    end

    if tag == 'boyfriend2' then
        doTweenY('boyfriend1', 'boyfriend', bfY - 12, 2, 'cubeInOut');
    end
    if tag == 'dad2' then
        doTweenY('dad1', 'dad', dadY + 12, 2, 'cubeInOut');
    end
end