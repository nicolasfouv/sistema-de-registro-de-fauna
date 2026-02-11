import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Content } from "../components/content";
import { getPageConfig, initRegistry } from "../contents/contentRegistry";

initRegistry();

export function DynamicContent() {
    const { categoryId, subCategoryId, formId } = useParams();
    const navigate = useNavigate();

    const [config, setConfig] = useState(getPageConfig(categoryId!, subCategoryId!));
    const [contents, setContents] = useState<any[]>([]);

    const loadData = async () => {
        if (!config) return;
        const loadedContents = await Promise.all(config.contents.map(async (contentConf) => {
            const contentProps = { ...contentConf.component };

            if (contentConf.loader) {
                const data = await contentConf.loader();
                contentProps.data = data;
            }

            return contentProps;
        }));
        setContents(loadedContents);
    };

    useEffect(() => {
        const pageConfig = getPageConfig(categoryId!, subCategoryId!);
        if (!pageConfig) {
            console.error("Página não encontrada", categoryId, subCategoryId);
            navigate('/404');
            return;
        }

        setConfig(pageConfig);
    }, [categoryId, subCategoryId]);

    useEffect(() => {
        if (config) {
            loadData();
        }
    }, [config]);

    if (!config || contents.length === 0) {
        return <div className="p-8 text-text-main">Carregando...</div>;
    }

    const handleFormChange = (newFormId: string) => {
        navigate(`/${categoryId}/${subCategoryId}/${newFormId}`);
    };

    if (!formId) {
        navigate(`/${categoryId}/${subCategoryId}/${config.contents[0].id}`);
        return;
    }

    return (
        <Content
            title={config.title}
            activeFormId={formId!}
            formChange={handleFormChange}
            contents={contents}
            onRefresh={loadData}
        />
    );
}
