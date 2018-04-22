function patreon_init()
    patreon = {}
    
    patreon.back = love.graphics.newImage("/sprites/Patreon_Background.png")
    
    patreon.number = 0
    patreon.sold = 0
end

function patreon_update()
    mouse.x, mouse.y = love.mouse.getPosition()
    
end

function patreon_draw()
    love.graphics.setFont(monogram)
    
    love.graphics.draw(patreon.back, 20, 60)
    
    love.graphics.print( patreon.number.." patrons", 30, 280)
    love.graphics.print(patreon.sold.."$", 30, 320)
end