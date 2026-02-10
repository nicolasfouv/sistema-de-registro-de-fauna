import { type ContentProps } from "../../components/content";

export interface Applicant {
    id: string,
    name: string,
    email: string,
    date: string,
    message: string,
}

export const ApplicantPermissionsContent: ContentProps<Applicant> = {
    id: 'solicitacoes',
    label: 'Solicitações',
    columns: [
        {
            key: 'name',
            label: 'Nome',
            width: 'w-1/5'
        },
        {
            key: 'email',
            label: 'E-mail',
            width: 'w-2/5'
        },
        {
            key: 'date',
            label: 'Data',
            width: 'w-1/5'
        }
    ],
    data: [ // API REST
        {
            id: '1',
            name: 'Solicitante 1',
            email: 'solicitante1@exemplo.com',
            date: '2022-01-01',
            message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        },
        {
            id: '2',
            name: 'Solicitante 2',
            email: 'solicitante2@exemplo.com',
            date: '2022-01-02',
            message: 'Não há justificativa da solicitação.'
        }
    ],
    rowIdField: 'id',
    renderActions: (item: Applicant, isExpanded, toggle) => (
        <button
            onClick={() => toggle(item.id)}
            className="text-standard-blue text-xs font-bold uppercase cursor-pointer"
        >
            {isExpanded ? 'Recolher' : 'Expandir'}
        </button>
    ),
    renderExpansion: (item: Applicant, close) => (
        <>
            <div className="sticky top-0 z-10 bg-form-bg py-2">
                <div className="flex justify-between items-center mb-4 border-b border-border">
                    <h3 className="font-bold text-text-main uppercase">Informações da Solicitação</h3>
                    <div className="flex gap-2 text-xs font-bold uppercasse">
                        <button className="text-green-600 uppercase cursor-pointer">Aceitar</button>
                        <button className="text-red-600 uppercase cursor-pointer">Recusar</button>
                        <button onClick={close} className="text-standard-blue uppercase cursor-pointer">Recolher</button>
                    </div>
                </div>
                <p className="mb-2"><strong>ID:</strong> {item.id}</p>
                <p className="mb-2"><strong>Data:</strong> {item.date}</p>
                <p className="mb-2"><strong>Nome:</strong> {item.name}</p>
                <p className="mb-2"><strong>E-mail:</strong> {item.email}</p>
                <hr className="border-border" />
            </div>
            <div className="text-sm text-text-main">
                <p className="mb-2"><strong>Mensagem:</strong> {item.message}</p>
            </div>
        </>
    )
};
