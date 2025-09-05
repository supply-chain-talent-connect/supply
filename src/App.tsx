import { Container, Title, Text, Button, Group } from '@mantine/core'
import { useTranslation } from 'react-i18next'

function App() {
  const { t } = useTranslation()

  return (
    <Container size="md" mt="xl">
      <Title order={1}>{t('welcome')}</Title>
      <Text mt="md">{t('app.description')}</Text>
      <Group mt="xl">
        <Button>{t('app.getStarted')}</Button>
        <Button variant="light">{t('app.learnMore')}</Button>
      </Group>
    </Container>
  )
}

export default App
