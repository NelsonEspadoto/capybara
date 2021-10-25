describe "Caixa de Opções", :dropdown do
    it "Item específico simples" do
        visit '/dropdown'

        select('Loki', from: 'dropdown')
    end

    it "Item específico com find" do
        visit '/dropdown'

        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
    end
    
    it "Qualquer item" do
        visit '/dropdown'

        drop = find('.avenger-list')
        drop.all('option').sample.select_option
    end
    
end
