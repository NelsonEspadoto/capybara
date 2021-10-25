describe "Criando Cadastro com IDs Dinâmico", :dinamico do
    before(:each) do
        visit '/access'
    end

    # ^ => Começa com
    # $ => Termina com
    # * => Contém

    it "Login com sucesso" do
        find('input[id$=UsernameInput]').set 'Nelson'
        find('input[id^=PasswordInput]').set '123456'
        find('a[id*=GetStartedButton]').click

        expect(find('#result')).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!' 
    end   
end