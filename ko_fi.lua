function kofi_init()
    ko_fi = {}
    
    ko_fi.back = love.graphics.newImage("/sprites/KoFi_Background.png")
end

function kofi_update()
    
end

function kofi_draw()
    love.graphics.draw(ko_fi.back, 20, 60)
    
    love.graphics.setFont(monogram_kofi)
    love.graphics.print("Thanks for the support!", 30, 180)
    love.graphics.print("Luigi", 120, 220)
    love.graphics.print("Xana", 125, 245)
    
    love.graphics.setFont(monogram)
    love.graphics.print("Buy me a Coffee!", 40, 387)
end