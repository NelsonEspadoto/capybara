describe "Tabelas", :tabs do
    before(:each) do
        visit '/tables'
    end

    it "Deve exibir o salário do Stark" do
        atores = all('table tbody tr')
        stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr') }
        expect(stark.text).to include '10.000.000'
    end

    it "Deve exibir o salário do Vin Diesel" do
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content '10.000.000'  
    end

    it "Deve exibir o filme do Vin Diesel" do
        diesel = find('table tbody tr', text: '@vindiesel')
        movie = diesel.all('td')[2].text

        expect(diesel).to have_content 'Velozes e Furiosos'  
    end

    it "Deve exibir o insta do Chris Evans" do
        evans = find('table tbody tr', text: 'Chris Evans')
        insta = evans.all('td')[4].text

        expect(insta).to eql '@teamcevans'  
    end

    it "Deve selecionar Chris Pratt para remoção" do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a.delete').click
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'  
    end

    it "Deve selecionar Chris Pratt para edição" do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a.edit').click
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'  
    end
end
