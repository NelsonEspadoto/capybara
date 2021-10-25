describe "Alertas de JS", :alerts do
    before(:each) do
        visit '/javascript_alerts'
    end

    after(:each) do
        sleep 2
    end

    it "Alerta" do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
    end

    it "Sim confirma" do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
        sleep 1
    end

    it "Não confirma" do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end
    
    it "Accept prompt" do
        accept_prompt(with: 'Nelson') do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, Nelson'
    end

    it "Dismiss prompt", :dismiss_prompt do
        dismiss_prompt() do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, null'
    end
end
