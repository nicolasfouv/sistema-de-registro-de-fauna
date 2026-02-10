import { type ContentProps } from "../../components/content";
import { acceptApplicant, getApplicants, rejectApplicant } from "../../services/applicantService";

export interface Applicant {
    id: string,
    name: string,
    email: string,
    date: string,
    message: string,
}

export const ApplicantContentDefinition = {
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
    rowIdField: 'id',
    renderActions: (item: Applicant, isExpanded: boolean, toggle: (id: string) => void) => (
        <button
            onClick={() => toggle(item.id)}
            className="text-standard-blue text-xs font-bold uppercase cursor-pointer"
        >
            {isExpanded ? 'Recolher' : 'Expandir'}
        </button>
    ),
    renderExpansion: (item: Applicant, close: () => void) => (
        <>
            <div className="sticky top-0 z-10 bg-form-bg py-2">
                <div className="flex justify-between items-center mb-4 border-b border-border">
                    <h3 className="font-bold text-text-main uppercase">Informações da Solicitação</h3>
                    <div className="flex gap-2 text-xs font-bold uppercasse">
                        <button onClick={() => acceptApplicant(item.id).then(() => window.location.reload())} className="text-green-600 uppercase cursor-pointer">Aceitar</button>
                        <button onClick={() => rejectApplicant(item.id).then(() => window.location.reload())} className="text-red-600 uppercase cursor-pointer">Recusar</button>
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
                <p className="mb-2"><strong>Mensagem:</strong> {item.message || <span className="text-gray-500">Não há justificativa da requisição</span>}</p>
            </div>
        </>
    )
};

export const fetchApplicantsData = async () => {
    return getApplicants();
};

export const ApplicantPermissionsContent: ContentProps<Applicant> = {
    ...ApplicantContentDefinition,
    data: [],
} as unknown as ContentProps<Applicant>;