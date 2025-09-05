import { Container, Title, Text, Button, Group } from '@mantine/core'
import { useTranslation } from 'react-i18next'

function App() {
  const { t } = useTranslation()

  return (
    <Container size="md" mt="xl">
      <Title order={1}>{t('welcome')}</Title>
      <Text mt="md">Supply Chain Management System</Text>
      <Group mt="xl">
        <Button>Get Started</Button>
        <Button variant="light">Learn More</Button>
      </Group>
    </Container>
  )
}

export default App
