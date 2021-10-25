describe "Upload", :upload do
    before(:each) do
        visit '/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/imagem.png'
    end

    after(:each) do
        sleep 2
    end

    it "Upload com arquivo de texto" do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        expect(find('#uploaded-file').text).to eql 'arquivo.txt'
    end
    
    it "Upload de imagem", :upload_imagem do
        attach_file('file-upload', @imagem)
        click_button 'Upload'

        # img = find('#new-image')
        expect(find('#new-image')[:src]).to include '/uploads/imagem.png'
    end
end
