describe "Login 3", :login3 do
    before(:each) do
        visit '/access'
    end

    it "Login com sucesso" do
        # login_form = find('#login')

        # login_form.find('input[name=username]').set 'stark'
        # login_form.find('input[name=password]').set "jarvis!"

        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'
            click_button 'Entrar'
        end

        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!' 
    end

    it "Cadastro com sucesso" do
        within('#signup') do
            find('input[name=username]').set 'nelson'
            find('input[name=password]').set '123456'
            click_link 'Criar Conta'
        end

        expect(find('#result')).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!' 
    end
    
end