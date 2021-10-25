describe "Caixa de Seleção", :checkbox do
    before(:each) do
        visit '/checkboxes'
    end

    after(:each) do
        sleep 2
    end

    it "Marcando um opção" do
        check('thor')
    end
    
    it "Desmarcando uma opção" do
        uncheck('antman')
    end

    it "Marcando com o find set true" do
        find('input[value=cap]').set(true)
    end
    
    it "Desmarcando com o find set false" do
        find('input[value=guardians]').set(false)
    end
end
