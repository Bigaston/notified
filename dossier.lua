function dossier_init()
    dossier={}
    dossier.back = love.graphics.newImage("/sprites/Dossier/Background.png")
    dossier.items = {}
    table.insert(dossier.items,love.graphics.newImage("/sprites/Dossier/Dossier_Content1.png"))
    table.insert(dossier.items,love.graphics.newImage("/sprites/Dossier/Dossier_Content2.png"))
    table.insert(dossier.items,love.graphics.newImage("/sprites/Dossier/Dossier_Content3.png"))
    table.insert(dossier.items,love.graphics.newImage("/sprites/Dossier/Dossier_Content4.png"))
    table.insert(dossier.items,love.graphics.newImage("/sprites/Dossier/Dossier_Content5.png"))
    table.insert(dossier.items,love.graphics.newImage("/sprites/Dossier/Dossier_Content6.png"))
    table.insert(dossier.items,love.graphics.newImage("/sprites/Dossier/Dossier_Content7.png"))
    table.insert(dossier.items,love.graphics.newImage("/sprites/Dossier/Dossier_Content8.png"))
    table.insert(dossier.items,love.graphics.newImage("/sprites/Dossier/Dossier_Content9.png"))
                                        
    dossier.alive = {}
    for i=0,8 do 
        table.insert(dossier.alive, true)
    end
    
    dossier.ball = {}
    dossier.ball.x = 140
    dossier.ball.y = 370
    dossier.ball.sprite = love.graphics.newImage("/sprites/Dossier/Dossier_Balle.png")
    dossier.ball.dx = 0
    dossier.ball.dy = 3
    dossier.ball.move = false
     
    dossier.barre = {}
    dossier.barre.x = 110
    dossier.barre.sprite = love.graphics.newImage("/sprites/Dossier/Dossier_Barre.png")
    
    dossier.shoot = 0
end

function dossier_update()
    if dossier.ball.move then
        dossier.ball.x = dossier.ball.x + dossier.ball.dx
        dossier.ball.y = dossier.ball.y + dossier.ball.dy
    end
    
    if dossier.ball.x >= 270 then
        dossier.ball.dx = - dossier.ball.dx 
    end
    
    if dossier.ball.x <= 20 then
        dossier.ball.dx = - dossier.ball.dx 
    end
    
    if dossier.ball.y <= 60 then
        dossier.ball.dy = - dossier.ball.dy 
    end

    if love.keyboard.isDown("right") then
        dossier.barre.x = dossier.barre.x + 5
        
        if dossier.barre.x > 210 then
            dossier.barre.x = 210 
        end
    end
    
    if love.keyboard.isDown("left") then
       dossier.barre.x = dossier.barre.x - 5 
    
        if dossier.barre.x < 20 then
            dossier.barre.x = 20 
        end
    end
    
    dossier_hitbox_barre()
    dossier_hitbox_item()
    
    if dossier.shoot == 9 then
        win.dossier = true
        screen = "menu" 
    end
end

function dossier_draw()
    love.graphics.draw(dossier.back, 20, 60)
    for i=0, 2 do
        for l=1, 3 do
            if dossier.alive[i*3+l]==true then
                love.graphics.draw(dossier.items[i*3+l], 40+i*90, 80+(l-1)*70)
            end
        end
    end
    
    love.graphics.draw(dossier.ball.sprite, dossier.ball.x, dossier.ball.y)
    love.graphics.draw(dossier.barre.sprite, dossier.barre.x, 400)
end

function dossier_hitbox_barre()
    if dossier.ball.y >= 380 and dossier.ball.y <= 400 then
        if (dossier.ball.x <= dossier.barre.x + 80 and dossier.ball.x >= dossier.barre.x) or (dossier.ball.x + 20 <= dossier.barre.x + 80 and dossier.ball.x + 20 >= dossier.barre.x) then
            dossier.ball.dy = - dossier.ball.dy
            dossier.ball.dx = ( dossier.ball.x - (dossier.barre.x + 40 )) / 10 
        end
    end
    
    if dossier.ball.y >= 420 then
        screen="menu" 
    end
end

function dossier_hitbox_item()
    if dossier.alive[1] then
        if dossier.ball.y + 10 >= 80 and dossier.ball.y + 10 <= 130 then
            if dossier.ball.x + 10 >= 40 and dossier.ball.x + 10 <= 90 then
                dossier.alive[1] = false
                dossier.ball.dy = - dossier.ball.dy
                
                dossier.shoot = dossier.shoot + 1
            end
        end
    end
    
    if dossier.alive[2] then
        if dossier.ball.y + 10 >= 150 and dossier.ball.y + 10 <= 200 then
            if dossier.ball.x + 10 >= 40 and dossier.ball.x + 10 <= 90 then
                dossier.alive[2] = false
                dossier.ball.dy = - dossier.ball.dy
                
                dossier.shoot = dossier.shoot + 1
            end
        end
    end
    
    if dossier.alive[3] then
        if dossier.ball.y + 10 >= 220 and dossier.ball.y + 10 <= 270 then
            if dossier.ball.x + 10 >= 40 and dossier.ball.x + 10 <= 90 then
                dossier.alive[3] = false
                dossier.ball.dy = - dossier.ball.dy
                
                dossier.shoot = dossier.shoot + 1
            end
        end
    end
    
    if dossier.alive[4] then
        if dossier.ball.y + 10 >= 80 and dossier.ball.y + 10 <= 130 then
            if dossier.ball.x + 10 >= 130 and dossier.ball.x + 10 <= 180 then
                dossier.alive[4] = false
                dossier.ball.dy = - dossier.ball.dy
                
                dossier.shoot = dossier.shoot + 1
            end
        end
    end
    
    if dossier.alive[5] then
        if dossier.ball.y + 10 >= 150 and dossier.ball.y + 10 <= 200 then
            if dossier.ball.x + 10 >= 130 and dossier.ball.x + 10 <= 180 then
                dossier.alive[5] = false
                dossier.ball.dy = - dossier.ball.dy
                
                dossier.shoot = dossier.shoot + 1
            end
        end
    end
    
    if dossier.alive[6] then
        if dossier.ball.y + 10 >= 220 and dossier.ball.y + 10 <= 270 then
            if dossier.ball.x + 10 >= 130 and dossier.ball.x + 10 <= 180 then
                dossier.alive[6] = false
                dossier.ball.dy = - dossier.ball.dy
                
                dossier.shoot = dossier.shoot + 1
            end
        end
    end
    
    if dossier.alive[7] then
        if dossier.ball.y + 10 >= 80 and dossier.ball.y + 10 <= 130 then
            if dossier.ball.x + 10 >= 220 and dossier.ball.x + 10 <= 270 then
                dossier.alive[7] = false
                dossier.ball.dy = - dossier.ball.dy
                
                dossier.shoot = dossier.shoot + 1
            end
        end
    end
    
    if dossier.alive[8] then
        if dossier.ball.y + 10 >= 150 and dossier.ball.y + 10 <= 200 then
            if dossier.ball.x + 10 >= 220 and dossier.ball.x + 10 <= 270 then
                dossier.alive[8] = false
                dossier.ball.dy = - dossier.ball.dy
                
                dossier.shoot = dossier.shoot + 1
            end
        end
    end
    
    if dossier.alive[9] then
        if dossier.ball.y + 10 >= 220 and dossier.ball.y + 10 <= 270 then
            if dossier.ball.x + 10 >= 220 and dossier.ball.x + 10 <= 270 then
                dossier.alive[9] = false
                dossier.ball.dy = - dossier.ball.dy
                
                dossier.shoot = dossier.shoot + 1
            end
        end
    end
end