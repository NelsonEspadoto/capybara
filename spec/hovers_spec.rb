describe "Mouse Hover", :hovers do
    before(:each) do
        visit '/hovers'
    end

    it "Quando passo o mouse sobre o Blade" do
        card = find('img[alt*=Blade]') #contem
        card.hover

        expect(page).to have_content 'Nome: Blade'  
    end

    it "Quando passo o mouse sobre o Pantera Negra" do
        card = find('img[alt^=Pantera]') #começa
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'  
    end

    it "Quando passo o mouse sobre o Homem Aranha" do
        card = find('img[alt$=Aranha]') #termina
        card.hover

        expect(page).to have_content 'Nome: Homem Aranha'  
    end

    after(:each) do
        sleep 1
    end
end
