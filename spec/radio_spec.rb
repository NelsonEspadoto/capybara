describe "Botões de Radio", :radio do
    before(:each) do
        visit '/radios'
    end

    after(:each) do
        sleep 2
    end

    it "Seleção por ID" do
        choose('cap')
    end
    
    it "Seleção por find e css selector" do
        find('input[value=the-avengers').click
    end
end
