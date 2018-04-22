function nav_init()
    nav = {}
    nav.back = love.graphics.newImage("/sprites/Nav/Nav_Background.png")
    
    nav.loupe = {}
    nav.loupe.sprite = love.graphics.newImage("/sprites/Nav/Nav_Loupe.png")
    nav.loupe.x = 240
    
    nav.bullet = {}
    table.insert(nav.bullet, love.graphics.newImage("/sprites/Nav/Nav_Tire1.png"))
    table.insert(nav.bullet, love.graphics.newImage("/sprites/Nav/Nav_Tire2.png"))
    table.insert(nav.bullet, love.graphics.newImage("/sprites/Nav/Nav_Tire3.png"))
    table.insert(nav.bullet, love.graphics.newImage("/sprites/Nav/Nav_Tire4.png"))
    table.insert(nav.bullet, love.graphics.newImage("/sprites/Nav/Nav_Tire5.png"))
    
    nav.letters = {}
    nav.letters.alive = {}
    nav.letters.sprite = {}
    
    for i=0, 5 do
        table.insert(nav.letters.alive, true) 
    end
    
    table.insert(nav.letters.sprite, love.graphics.newImage("/sprites/Nav/Nav_Letters1.png"))
    table.insert(nav.letters.sprite, love.graphics.newImage("/sprites/Nav/Nav_Letters2.png"))
    table.insert(nav.letters.sprite, love.graphics.newImage("/sprites/Nav/Nav_Letters3.png"))
    table.insert(nav.letters.sprite, love.graphics.newImage("/sprites/Nav/Nav_Letters4.png"))
    table.insert(nav.letters.sprite, love.graphics.newImage("/sprites/Nav/Nav_Letters5.png"))
    
    nav.shoot = 0
    nav.our_bullet = {}
    nav.their_bullet = {}
    
    nav.max = 0
end

function nav_hitbox_letters()
    
    nav.max = 0
    
    for i=1, table.getn(nav.our_bullet) - nav.max do
        if nav.our_bullet[i].y <= 180 and nav.our_bullet[i].x + 5 >= 50 and nav.our_bullet[i].x + 5 <= 100 and nav.letters.alive[1] then
            nav.letters.alive[1] = false
            nav.max = nav.max + 1 
            table.remove(nav.our_bullet, i)
            nav.shoot = nav.shoot + 1
            
        elseif nav.our_bullet[i].y <= 180 and nav.our_bullet[i].x + 5 >= 110 and nav.our_bullet[i].x + 5 <= 150 and nav.letters.alive[2] then
            nav.letters.alive[2] = false
            nav.max = nav.max + 1  
            table.remove(nav.our_bullet, i)  
            nav.shoot = nav.shoot + 1
        
        elseif nav.our_bullet[i].y <= 210 and nav.our_bullet[i].x + 5 >= 160 and nav.our_bullet[i].x + 5 <= 200 and nav.letters.alive[3] then
            nav.letters.alive[3] = false
            nav.max = nav.max + 1  
            table.remove(nav.our_bullet, i)
            nav.shoot = nav.shoot + 1
        
        elseif nav.our_bullet[i].y <= 180 and nav.our_bullet[i].x + 5 >= 210 and nav.our_bullet[i].x + 5 <= 220 and nav.letters.alive[4] then
            nav.letters.alive[4] = false
            nav.max = nav.max + 1   
            table.remove(nav.our_bullet, i) 
            nav.shoot = nav.shoot + 1
        
        elseif nav.our_bullet[i].y <= 180 and nav.our_bullet[i].x + 5 >= 230 and nav.our_bullet[i].x + 5 <= 260 and nav.letters.alive[5] then
            nav.letters.alive[5] = false
            nav.max = nav.max + 1
            table.remove(nav.our_bullet, i) 
            
            nav.shoot = nav.shoot + 1
        end
    end
end

function nav_update()
    if love.keyboard.isDown("right") then
        nav.loupe.x = nav.loupe.x + 3
        
        if nav.loupe.x > 245 then
            nav.loupe.x = 245 
        end
    end
    
    if love.keyboard.isDown("left") then
       nav.loupe.x = nav.loupe.x - 3
    
        if nav.loupe.x < 40 then
            nav.loupe.x = 40 
        end
    end
    
    for i = 1, table.getn(nav.our_bullet) do
        nav.our_bullet[i].y = nav.our_bullet[i].y - 2
    end
    
    if table.getn(nav.our_bullet) >= 1 then
        if nav.our_bullet[1].y <= 60 then
            table.remove(nav.our_bullet, 1) -- HERE
        end
    end
    
    nav_hitbox_letters()
    
    if nav.shoot == 5 then
        win.nav = true
        screen="menu" 
    end
end

function naw_draw_letters()
    if nav.letters.alive[1] then
        love.graphics.draw(nav.letters.sprite[1], 50, 110) 
    end    
    
    if nav.letters.alive[2] then
        love.graphics.draw(nav.letters.sprite[2], 110, 110) 
    end    
    
    if nav.letters.alive[3] then
        love.graphics.draw(nav.letters.sprite[3], 160, 140) 
    end    
    
    if nav.letters.alive[4] then
        love.graphics.draw(nav.letters.sprite[4], 210, 110) 
    end    
    
    if nav.letters.alive[5] then
        love.graphics.draw(nav.letters.sprite[5], 230, 110) 
    end    
end

function nav_draw()
    love.graphics.draw(nav.back, 20, 60)
    love.graphics.draw(nav.loupe.sprite, nav.loupe.x, 383)
    
    for i=1, table.getn(nav.our_bullet) do
          love.graphics.draw(nav.bullet[5], nav.our_bullet[i].x, nav.our_bullet[i].y)
    end
    
    naw_draw_letters()
end