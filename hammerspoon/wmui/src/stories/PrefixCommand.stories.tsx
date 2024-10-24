import type { Meta, StoryObj } from '@storybook/react';
import React from 'react';

import { TextCommand } from '../TextCommand';
import { PrefixSelectCommand } from '../PrefixSelectCommand';
import App from '../App';
import { FromMessage, ToMessage } from '../messages';
import { expect, userEvent, waitFor, within } from '@storybook/test';
function CommandDecorator(Command: React.ComponentType<any>, { args, parameters }) {
    let receiveMessage = (msg: ToMessage) => {
        parameters.commandMessaging.lastReceivedMessage = msg
        parameters.commandMessaging.lastReceivedMessages.push(msg)
    }

    parameters.commandMessaging.sendMessage = (msg: FromMessage) => {
        parameters.commandMessaging.onMessage(
            new MessageEvent('message', { data: msg })
        )
    }

    return (
        <App
            RootCommand={Command}
            RootCommandProps={{
                prefixes: args.prefixes,
                index: args.index
            }}
            sendMessage={receiveMessage}
            setEventListener={onMessage => { parameters.commandMessaging.onMessage = onMessage }}
            removeEventListener={_ => parameters.commandMessaging.onMessage = null}
        />
    )
}

const meta = {
    title: 'PrefixCommand',
    component: PrefixSelectCommand,
    tags: ['autodocs'],
    parameters: {
        backgrounds: {
            grid: {
              cellSize: 20,
              opacity: 0.5,
              cellAmount: 5,
              offsetX: 16, // Default is 0 if story has 'fullscreen' layout, 16 if layout is 'padded'
              offsetY: 16, // Default is 0 if story has 'fullscreen' layout, 16 if layout is 'padded'
            },
          },
        layout: 'centered',
        commandMessaging: {
            lastReceivedMessage: null,
            lastReceivedMessages: [],
            onMessage: null
        },
    },
    decorators: [
        CommandDecorator,
    ],
    args: {
        prefixes: new Map(
            [
                [
                    'n',
                    {
                        component: TextCommand,
                        props: {
                            text: "Hello World!",
                        },
                        description: 'Null'
                    }
                ]
            ]
        ),
        index: 0,
        sendMessage: (msg: ToMessage) => { },
        handleDelete: () => { },
    },
} satisfies Meta<typeof PrefixSelectCommand>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Setup: Story = {
    play: async ({ canvasElement, parameters }) => {
        const canvas = within(canvasElement)
        await waitFor(() => {
            expect(parameters.commandMessaging.onMessage).not.toBeNull()
        })


        parameters.commandMessaging.sendMessage({ type: 'hammerspoonReady' })

        expect(parameters.commandMessaging.lastReceivedMessages[0]).toEqual({ type: 'uiReady' })
        expect(parameters.commandMessaging.lastReceivedMessages[1]).toEqual({ type: 'log', log: 'received message: {"type":"hammerspoonReady"}' })

        await waitFor(() => {
            expect(canvas.queryByTestId('app-loading')).not.toBeInTheDocument()
        })

        const prefixSelectCommand = canvas.getByTestId('prefix-select-command-0')
        expect(prefixSelectCommand).toBeInTheDocument()

        await waitFor(() => {
            expect(prefixSelectCommand).toHaveFocus()
        })
    },
}

export const Selected: Story = {
    play: async (playContext) => {
        const canvas = within(playContext.canvasElement)

        await Setup.play?.(playContext)

        const prefixSelectCommand = canvas.getByTestId('prefix-select-command-0')
        await userEvent.type(prefixSelectCommand, 'n')

        const textCommand = canvas.getByTestId('text-command-1')
        expect(textCommand).toBeInTheDocument()
        await waitFor(() => {
            expect(textCommand).toHaveFocus()
        })
    },
};

export const Backspaced: Story = {
    play: async (playContext) => {
        const canvas = within(playContext.canvasElement)

        await Setup.play?.(playContext)

        const prefixSelectCommand = canvas.getByTestId('prefix-select-command-0')
        await userEvent.type(prefixSelectCommand, 'n')

        const textCommand = canvas.getByTestId('text-command-1')
        expect(textCommand).toBeInTheDocument()
        await userEvent.type(textCommand, '{backspace}')

        await waitFor(() => {
            expect(canvas.queryByTestId('text-command-1')).not.toBeInTheDocument()
        })

        await waitFor(() => {
            expect(prefixSelectCommand).toHaveFocus()
        })
    },
};
