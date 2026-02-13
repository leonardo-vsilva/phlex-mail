# Code Box Component

Componente redesenhado e otimizado para exibir códigos OTP em emails com suporte total a customização de cores e opção de label descritivo.

## Características

- ✅ Compatível com todos os clientes de email (Gmail, Outlook, Apple Mail, etc.)
- ✅ Design limpo com bordas tracejadas
- ✅ Suporte a label opcional descritivo
- ✅ Cores totalmente customizáveis
- ✅ Fonte monoespacial para melhor legibilidade
- ✅ Espaçamento visual otimizado
- ✅ Suporte a Outlook com fallback VML

## Uso

### Padrão (sem label)

```ruby
Components::Content::CodeBox.new(
  code: "123 456"
).call
```

### Com Label

```ruby
Components::Content::CodeBox.new(
  code: "123 456",
  label: "CÓDIGO DE VERIFICAÇÃO"
).call
```

### Com Cores Customizadas

```ruby
Components::Content::CodeBox.new(
  code: "987 654",
  label: "CÓDIGO OTP",
  bg_color: "#f0f9ff",
  border_color: "#0ea5e9",
  text_color: "#0369a1",
  label_color: "#0369a1"
).call
```

## Parâmetros

| Parâmetro | Tipo | Padrão | Descrição |
|-----------|------|--------|-----------|
| `code` | String | "123 456" | Código a ser exibido |
| `label` | String | `nil` | Label descritivo (opcional) |
| `bg_color` | String | "#f3f4f6" | Cor de fundo da caixa |
| `border_color` | String | "#d7dadf" | Cor da borda (2px dashed) |
| `text_color` | String | "#1f2937" | Cor do texto do código |
| `label_color` | String | "#4b5563" | Cor do texto do label |
| `font_size` | String | "36px" | Tamanho da fonte do código |
| `letter_spacing` | String | "6px" | Espaçamento entre caracteres |
| `border_radius` | String | "6px" | Raio da borda arredondada |

## Variantes Disponíveis

### 1. Default
Caixa simples sem label, ideal para códigos iniciais ou notificações diretas.

```ruby
Components::Content::CodeBox.new(code: "123 456")
```

### 2. With Label
Com label descritivo no topo, deixando claro o propósito do código.

```ruby
Components::Content::CodeBox.new(
  code: "123 456",
  label: "CÓDIGO DE VERIFICAÇÃO"
)
```

### 3. Custom Colors
Adapte as cores à identidade visual da sua marca.

```ruby
Components::Content::CodeBox.new(
  code: "987 654",
  bg_color: "#f0f9ff",
  border_color: "#0ea5e9",
  text_color: "#0369a1"
)
```

## Estrutura HTML

O componente gera uma tabela aninhada otimizada para email com:
- Wrapper centralizado com `&zwj;` para suporte a clientes legados
- Tabela interna com bordas tracejadas
- Suporte a comentários MSO para Outlook (VML fallback)
- Código monoespacial com espaçamento visual adequado

## Compatibilidade

- ✅ Gmail
- ✅ Outlook (2007+)
- ✅ Apple Mail
- ✅ Thunderbird
- ✅ Yahoo Mail
- ✅ AOL Mail
- ✅ Mobile clients (iOS Mail, Android)

## Notas de Implementação

- O código é exibido em fonte monoespacial (`Courier New`) para melhor legibilidade
- O espaçamento entre caracteres (`letter-spacing: 6px`) facilita a leitura do código
- O padding dinâmico se ajusta de acordo com a presença ou não do label
- Todos os estilos são inline para máxima compatibilidade com clientes de email
