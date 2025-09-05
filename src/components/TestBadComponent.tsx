import { Button, Text } from '@mantine/core'

export function TestBadComponent() {
  const someVar: any = 'test'  // Should trigger no-explicit-any
  console.log('debug')  // Should trigger no-console
  
  return (
    <div>
      <Text>This is hardcoded text</Text>
      <Button>Click me now</Button>
      <p>Another hardcoded string</p>
    </div>
  )
}