import { type ContentProps } from "../components/content";

export interface PageConfig {
    title: string;
    adminOnly?: boolean;
    contents: ContentConfig[];
}

export interface ContentConfig {
    id: string; // formId
    label: string;
    loader?: () => Promise<any>;
    component: ContentProps<any>;
}

// Registry storage
const registry: Record<string, Record<string, PageConfig>> = {};

export function registerContent(
    categoryId: string,
    subCategoryId: string,
    pageTitle: string,
    content: ContentConfig,
    adminOnly?: boolean
) {
    if (!registry[categoryId]) {
        registry[categoryId] = {};
    }
    if (!registry[categoryId][subCategoryId]) {
        registry[categoryId][subCategoryId] = {
            title: pageTitle,
            adminOnly: adminOnly,
            contents: []
        };
    }

    const existingIndex = registry[categoryId][subCategoryId].contents.findIndex(c => c.id === content.id);
    if (existingIndex >= 0) {
        registry[categoryId][subCategoryId].contents[existingIndex] = content;
    } else {
        registry[categoryId][subCategoryId].contents.push(content);
    }
}

export function getPageConfig(categoryId: string, subCategoryId: string): PageConfig | null {
    return registry[categoryId]?.[subCategoryId] || null;
}

import { fetchUsersData, UsersPermissionsContent } from "./admin/users";
import { ApplicantPermissionsContent, fetchApplicantsData } from "./admin/applicants";

export function initRegistry() {
    registerContent('admin', 'permissoes', 'Permissões', {
        id: 'usuarios',
        label: 'Usuários',
        loader: fetchUsersData,
        component: UsersPermissionsContent
    }, true);

    registerContent('admin', 'permissoes', 'Permissões', {
        id: 'solicitacoes',
        label: 'Solicitações',
        loader: fetchApplicantsData,
        component: ApplicantPermissionsContent
    }, true);
}
