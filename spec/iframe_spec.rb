describe "Iframes" do
    after(:each) do
        sleep 3
    end

    describe "Iframe bom", :iframe_bom do
        
        it "Adicionar produto no carrinho" do
            visit '/nice_iframe'

            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50' 
            end
        end
    end

    describe "Iframe ruim", :iframe_ruim do
        
        it "Adicionar produto no carrinho" do
            visit '/bad_iframe'
            
            script = '$(".box-iframe").attr("id", "tempId");'
            page.execute_script(script)

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'  
            end
        end
    end
    
    
end
