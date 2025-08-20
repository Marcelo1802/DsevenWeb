# DSeven Flutter App

Um projeto Flutter web que demonstra a implementação de Clean Architecture com padrão MVVM.

## 🏗️ Arquitetura

Este projeto segue os princípios da Clean Architecture organizados em camadas:

### 📁 Estrutura do Projeto

```
lib/
├── core/                    # Configurações e utilitários centrais
│   ├── di/                  # Injeção de dependência
│   ├── error/               # Tratamento de erros
│   ├── network/             # Informações de rede
│   └── usecases/            # Casos de uso base
├── domain/                  # Camada de domínio (regras de negócio)
│   ├── entities/            # Entidades
│   ├── repositories/        # Contratos dos repositórios
│   └── usecases/            # Casos de uso
├── data/                    # Camada de dados
│   ├── datasources/         # Fontes de dados (local/remoto)
│   ├── models/              # Modelos de dados
│   └── repositories/        # Implementação dos repositórios
└── presentation/            # Camada de apresentação (UI)
    ├── viewmodels/          # ViewModels (MVVM)
    ├── views/               # Telas
    └── widgets/             # Widgets reutilizáveis
```

### 🔄 Padrões Utilizados

- **Clean Architecture**: Separação clara de responsabilidades
- **MVVM**: Model-View-ViewModel para gerenciamento de estado
- **Repository Pattern**: Abstração das fontes de dados
- **Dependency Injection**: Inversão de controle com GetIt
- **Provider**: Gerenciamento de estado reativo

## 🚀 Tecnologias

- **Flutter**: Framework de desenvolvimento
- **Provider**: Gerenciamento de estado
- **GetIt**: Injeção de dependência
- **Dartz**: Programação funcional
- **HTTP**: Cliente HTTP
- **SharedPreferences**: Armazenamento local
- **JSON Serialization**: Serialização de dados

## 📱 Funcionalidades

- ✅ Lista de usuários
- ✅ Detalhes do usuário
- ✅ Cache local
- ✅ Tratamento de erros
- ✅ Estados de loading
- ✅ Conectividade de rede
- ✅ Interface responsiva

## 🛠️ Como Executar

### Pré-requisitos

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)

### Passos

1. **Clone o projeto**
   ```bash
   cd Dseven
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Gere os arquivos necessários**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Execute o projeto web**
   ```bash
   flutter run -d chrome
   ```

## 🏛️ Arquitetura Detalhada

### Domain Layer (Camada de Domínio)
- **Entities**: Objetos de negócio puros
- **Repositories**: Contratos para acesso a dados
- **Use Cases**: Lógica de negócio específica

### Data Layer (Camada de Dados)
- **Models**: Extensões das entidades com serialização
- **Data Sources**: Implementações de acesso a dados
- **Repository Implementation**: Implementação dos contratos

### Presentation Layer (Camada de Apresentação)
- **ViewModels**: Lógica de apresentação e estado
- **Views**: Telas da aplicação
- **Widgets**: Componentes reutilizáveis

## 🔧 Configuração

### Injeção de Dependência
O projeto utiliza GetIt para injeção de dependência, configurado em `core/di/dependency_injection.dart`.

### Tratamento de Erros
Sistema robusto de tratamento de erros com tipos específicos de falhas.

### Cache
Implementação de cache local usando SharedPreferences para offline-first.

## 📈 Próximos Passos

- [ ] Testes unitários
- [ ] Testes de integração
- [ ] Animações e transições
- [ ] Tema escuro
- [ ] Internacionalização
- [ ] PWA completa

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT.
