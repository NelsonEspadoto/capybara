describe "Select2" do

    describe "Single", :single do
        before(:each) do
            visit '/apps/select2/single.html'
        end

        it "Seleciona o Ator pelo Nome" do
            find('.select2-container').click
            sleep 1
            find('.select2-results__option', text: "Adam Sandler").click
            sleep 2
        end

        it "Busca e clica no ator" do
            find('.select2-container').click
            sleep 1
            find('.select2-search__field').set 'Kevin James'
            sleep 1
            find('.select2-results__option').click
            sleep 2
        end
        
    end
    
    describe "Multiple", :multiple do
        before(:each) do
            visit '/apps/select2/multi.html'
        end

        def selecione(ator)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end

        atores = ['Jim Carrey', 'Owen Wilson', 'Kevin James']

        it "Selecionar Atores" do
            selecione('Chris Rock')

            atores.each do |ator|
                selecione(ator)
            end

            find('li[title="Jim Carrey"] > span').click
            sleep 2
        end
    end    
end
