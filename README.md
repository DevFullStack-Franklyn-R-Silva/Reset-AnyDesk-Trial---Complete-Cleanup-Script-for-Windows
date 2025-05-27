# Reset AnyDesk Trial - Complete Cleanup Script for Windows

Este script em batch foi desenvolvido para **remover completamente o AnyDesk do sistema**, incluindo:

- Encerramento forçado dos processos do AnyDesk (`AnyDesk.exe` e `ad.exe`)
- Exclusão da pasta de dados do AnyDesk para todos os usuários do sistema (`AppData\Roaming\AnyDesk`)
- Exclusão da pasta do AnyDesk em `C:\ProgramData`
- Exclusão de chaves de registro relacionadas ao AnyDesk
- Remoção de entradas de desinstalação para tentar **renovar o período de avaliação (trial)**

### ⚠️ Aviso
Este script deve ser executado com **permissões de administrador**, pois faz alterações em registros do sistema e arquivos protegidos.

### 📌 Uso
1. Salve o conteúdo do script em um arquivo `.bat`, por exemplo: `reset_anydesk.bat`
2. Clique com o botão direito sobre o arquivo e escolha **Executar como administrador**
3. Aguarde a execução completa e pressione uma tecla para sair

### ❗ Importante
- Use com responsabilidade. Este script remove dados permanentemente.
- Não recomendado em ambientes de produção sem autorização apropriada.
